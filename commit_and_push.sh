 #!/bin/bash

 COMMIT_MESSAGE=$1

 if [ -n "$COMMIT_MESSAGE" ]
 then
     git add -A
     git commit -m "$COMMIT_MESSAGE"
     echo "Successfully committed"
     echo "Push to origin with current branch? (y/n)"
     read PUSH_VAL
     if [ "$PUSH_VAL" = "y" ]
     then
         BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
         git push origin +$BRANCH_NAME
         echo "Successfully pushed to origin/$BRANCH_NAME"
     fi
 else
     echo "Please enter a commit message"
 fi
