# sqldb
Simple SQL parser and backend to figure out tables and columns that are the same even when named differently

The Qdb directory contains the haskell "stack" that builds the compiler.  This compiler (called qdb) uses happy and alex to
create the front-end for processing simple select statements containing equa-joins.  The backend of the compiler outputs
"lists" of database.table.column names that are equivalent.  For example:

   select t1.c1 from t1, t2 where t1.c3 = t2.c4
   
generates the list "t1.c3,t2.c4"

Similarly, the queries

     select t1.c1 from t1, t2 where t1.c3 = t2.c4
     select t5.c1 from t2, t5 where t2.c4 = t5.c1
    
generates the list "t1.c3,t2.c4,t5.c1"  since they are all "equivalent"

Within the Qdb directory is a readme file that goes into more detail.

The Tdb directory contains the haskell "stack" that builds the program that figures out which table/columns are equivalent.  I call
this program tdb.  The qdb compiler backend uses a simple algorithm to generate the lists of database.table.column name equivalents,
but this simple algorithm doesn't "coalesce" all the lists that are generated.  For example, in the second example above
if I "reverse" the equa-join in the "select t5.c1 ..." query so that it reads:

     select t5.c1 from t2, t5 where t5.c1 = t2.c4
     
the qdb compiler generates two lists:  "t1.c3,t2.c4", "t5.c1,t2.c4"

The tdb backend coalesces these and pretty prints the result

Last, the QTdb directory contains a driver that processes sql files.  Each sql file can contain multiple select statements.  The
QTdb directory has a readme that gives details.

The test driver (tdriver.sh) in the QTdb directory assumes that qdb, tdb executeables are on the "PATH."  I use the stack
build and install commands.  I have also set the PATH on my machine to point to the default bin directory that stack uses.

I will update this code from time-to-time.

Shlomo
