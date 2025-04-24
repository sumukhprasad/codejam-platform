### Public Archive

This repository will no longer receive updates as of April 2025. The last significant commit made to this repository was --

```
[0c517c9] Added abilty for admin to edit institutions and students.

(sumukhprasad) (Aug 29 2024)
```

Due to the termination of updates made to this codebase, attempts to fix or patch new security vulnerabilities will not be made. 

Developers are advised to fork this repository and make any necessary updates and changes before deployment.

---


# CodeJam Platform Server

CodeJam Platform Server provides backend services and the web interface for DiPS CodeJam 2024.

To set it up, ensure that the following system dependencies have been installed.

- ruby (>=3.2.2)
- foreman (>=0.88.1)
- postgresql (>=16.7)
- redis (>=7.2.7)


### Configuration

To configure CodeJam Platform for use, run:

```
bundle install
bundle update
```

then, to configure environment variables, create an environment file:
```
/.env

CODEJAM_DATABASE_USERNAME=example
CODEJAM_DATABASE_PASSWORD=example@example
MAIL_host="https://codejam.example.com"
MAIL_addr="smtp.mailserv.com"
MAIL_domain="mailserv.com"
MAIL_user="org@email.com"
MAIL_password="supersecurepassword"
```

then, to initialize your database, run:
```
rails db:create db:migrate db:seed
```

---

### Running and Deployment

To run the server, run the following command in your terminal:
```
foreman -v # >=0.88.1
foreman start
```

Ensure no errors are logged during startup. Visit [http://localhost:3000](http://localhost:3000) to ensure the platform is functional. 

---

### Admin configuration & contest creation

Navigate to `/admin` to log in to your CodeJam Platform instance's administration panel. An administrator account has been created with username `admin@exmaple.com` and password `password`. It is recommended that you create an account for yourself and delete the one seeded by default.

- Navigate to Contest Configuration and click _New Contest Configuration_ to add and configure your contest.
- Check the _Active_ checkbox at the end of the form to make it the configuration the platform will attempt to use.
- Use the Questions tab to add questions to the contest.
- Use the Testcases tab to add testcases to your questions Ensure **20 testcases** are assigned to each question.

**Note:** There is a known bug that causes the platform to interpret CRLF and LF line endings as not being the same. You must patch this before deploying the server.



### Students and Institutions

- Students and Instutions can create accounts for themselves through the homepage.
- Refer to the provided brochure.pdf and guide.pdf for further information.

---

Ensure that the platform is deployed with the RAILS_ENV environment variable set to production.