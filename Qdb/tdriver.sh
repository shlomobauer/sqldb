for i in `ls -1 sqls | sort -n -k1.5`
do
 echo $i:
 stack exec qdb sqls/$i
done
