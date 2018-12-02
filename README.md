# TaskManager
A web app that allows small to large scale businesses to effectively manage tasks across different teams

It has three different dashboards for each company registered with this app. One is for admins designated by company who can manage employess at all levels within the company. However, admins do not have privileges to manage tasks as they are independent of the teams they belong to. Second dashboard is for managers who are added to the system by admin. They have privileges to manage tasks at all levels ans=d also the users of their respective teams only. X manager cannot manage tasks or users(team member) of Y manager's team. The last dashboard is for team members/employees who have privileges with configuring tasks. There are some functionalities in Team member's dashboard that require approval from managers. Managers can approve or disapprove any task or anything related to it anytime. That's why team member cannot just add or create task for the team but he or she has to "propose" it to the manager of his or her team and then manager can approve or disapprove it with set deadline.


Technology Stack: HTML, CSS, Bootstrap, JSP, JavaScript, Java, Java Spring MVC, Hibernate, PostgreSQL
Tools: Eclipse Java EE, Oracle SQL Developer, Git, Github
Data Structures used: Priority Queue which allows to keep tasks according to their priorities

Future plans: I am currently reseacrching on automated priortizing the task. This involves classification problem such as classifying a task as "High or Low". Decision trees can be used and so is logistic regression model. This is the similar to how "Gmail prioritizes emails in the inbox". 
