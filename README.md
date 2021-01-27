# Test-Guru

Study project from Thinknetica Web-Development Course.

https://test-guru-georgiy.herokuapp.com/

# List of entities* for the Test-Guru project:

### User

  It has his own name and group. Authentication of user.

### Admin

  It inherits from the User model.

### Category

  It indicates on the category of the test.

### Test

  It is the main entity of the project.

### Question

  It belongs to tests; and contains question text and list of answers.

### Answer

  It is related to the question; and contains answer text.

### TestPassage

  Is is a reference table between `tests` and `users` tables. Also provides the access to the information about the correct answered questions of the user and link to the current question of the test passage.

### Badge

  It is about the achievements of the user. Only the admin could create, edit and delete the badges.

### Feedback

  It does not inherit from ApplicationRecord and includes the ActiveModel::Model module. The table does not exist in the DB for this model. 

### Gist

  It is about the saved gist with more interesting questions by users to their GitHub Gist account.

### UserBadge

  Is is a reference table between `users` and `badges` tables. It contains the information about the user and the badge, that he achieved by `ids` attributes.

###### *(real-world objects)
