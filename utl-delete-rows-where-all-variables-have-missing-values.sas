Delete rows where all variables have missing values

See recent simplification below by
Paul Dorfman
sashole@bellsouth.net

github
https://tinyurl.com/y7erwfzq
https://github.com/rogerjdeangelis/utl-delete-rows-where-all-variables-have-missing-values

see Stackoverflow
https://tinyurl.com/ych6nl9j
https://stackoverflow.com/questions/17291756/how-to-delete-blank-observations-in-a-data-set-in-sas

Joe profile
https://stackoverflow.com/users/1623007/joe

INPUT
=====

 WORK.HAVE total obs=7

  NAME     SEX    AGE    HEIGHT    WEIGHT

 Alfred     M      14     69.0      112.5
 Alice      F      13     56.5       84.0
                    .       .          .
 Carol      F      14     62.8      102.5
 Henry      M      14     63.5      102.5
                    .       .          .
 Jane       F      12     59.8       84.5

EXAMPLE OUTPUT
--------------

 WORK.WANT total obs=5

   NAME     SEX    AGE    HEIGHT    WEIGHT

  Alfred     M      14     69.0      112.5
  Alice      F      13     56.5       84.0
  Carol      F      14     62.8      102.5
  Henry      M      14     63.5      102.5
  Jane       F      12     59.8       84.5


PROCESS
========

See recent simplification below by
Paul Dorfman
sashole@bellsouth.net

data want;
  set have;
  if cmiss(of _all_) > 0 then delete;
run;quit;

data want;
  set have;
  if nmiss(of _numeric_) + cmiss(of _character_) > 0 then delete;
run;quit;

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

data have;
  set sashelp.class(obs=7);
  if mod(_n_,3)=0 then call missing(of _all_);
run;quit;


