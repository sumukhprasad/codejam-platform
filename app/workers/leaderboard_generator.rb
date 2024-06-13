class LeaderboardGenerator
	@queue = :leaderboard_generation_queue

	def self.perform
		puts "Generating leaderboard..."
		students = Student.all
		unranked_scores = Array.new
		score_values = Array.new
		for s in students do
			submissions = s.submissions
			raw_score = submissions.select { |submission| submission.is_correct == true}.map { |submission| submission.question.score }.sum
			
			gold_stars = submissions.pluck(:gold_star).count(true)
			silver_stars = submissions.pluck(:silver_star).count(true)
			bronze_stars = submissions.pluck(:bronze_star).count(true)
			
			total_score = raw_score + (gold_stars*50) + (silver_stars*25) + (bronze_stars*10)
			
			score_object = {
				:student => s,
				:raw_score => raw_score,
				:gold_stars => gold_stars,
				:silver_stars => silver_stars,
				:bronze_stars => bronze_stars,
				:total_score => total_score,
				:rank => 0
			}
			
			unranked_scores.push(score_object)
			if not score_values.include?(total_score)
				score_values.push(total_score)
			end
		end
		
		score_values = score_values.sort
		scores = unranked_scores
		
		scores.each { |score|
			score[:rank] = score_values.index(score[:total_score]) + 1
		}
		
				puts "Done. Writing to cache..."
		Rails.cache.write('leaderboard', scores)
		puts "Done."
	end
end