#!/bin/bash
for i in `ls tdfs`
do
 stack exec tdb tdfs/$i
done
