echo "start, `date`"
echo
echo "Creating Eqs"

rm -f eqs/*

for i in `ls -1 sqls | sort -n -k1.5`
do
 ii=${i%.*}
 echo "$i -> $ii.eq"
 qdb sqls/$i > eqs/$ii.eq
done

echo
echo "Creating Table/Column Maps"

rm -f maps/*

for i in `ls -1 eqs | sort -n -k1.5`
do
 ii=${i%.*}
 echo "$i -> $ii.map"
 tdb eqs/$i > maps/$ii.map
done

echo
echo "Showing Maps"
for i in `ls -1 maps | sort -n -k1.5`
do
 echo
 echo $i:
 cat maps/$i
done

echo
echo "done, `date`"
