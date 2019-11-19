 #!/bin/bash

 COMMIT_MESSAGE=$1

 if [ -n "$COMMIT_MESSAGE" ]
 then
     git add -A
     git commit -m "$COMMIT_MESSAGE"
     echo "Successfully committed"
     echo "Push to origin with current branch? (p/f/n)"
     read PUSH_VAL
     BRANCH_NAME=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
     if [ "$PUSH_VAL" = "p" ]
     then
         git push origin $BRANCH_NAME
         echo "Successfully pushed to origin/$BRANCH_NAME"
     elif [ "$PUSH_VAL" = "f" ]
     then
         git push origin +$BRANCH_NAME
         echo "Successfully force pushed to origin/$BRANCH_NAME"
     else
         echo "Done"
     fi
 else
     echo "Please enter a commit message"
 fi
