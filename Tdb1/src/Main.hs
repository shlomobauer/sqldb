module Main where
import System.Environment
import System.IO
import Data.List.Split
import Data.Set
-- import Data.List

main = do 
 let debug = False
 let unitTest = False

 if unitTest
 then do
  putStrLn ""
  putStrLn "Begin unitTest"
  putStrLn("\t" ++ "doBuildEqs1 (c1,c2) [] [[c3,c4],[c5,c6]]")
  let z = doBuildEqs1 ("c1","c2")[] [["c3","c4"],["c5","c6"]]
  putStrLn("\t" ++ "Actual:   " ++  (show z))
  putStrLn("\t" ++ "Expected: " ++
   "[[\"c3\",\"c4\"],[\"c5\",\"c6\"],[\"c1\",\"c2\"]]")

  putStrLn ""
  putStrLn("\t" ++ "doBuildEqs1 (c1,c2) [[c7,c8],[c9]] [[c3,c4],[c5,c6]]")
  let z = doBuildEqs1 ("c1","c2") [["c7","c8"],["c9"]] [["c3","c4"],["c5","c6"]]
  putStrLn("\t" ++ "Actual:   " ++  (show z))
  putStrLn("\t" ++ "Expected: " ++
   "[[\"c7\",\"c8\"],[\"c9\"],[\"c3\",\"c4\"],[\"c5\",\"c6\"],[\"c1\",\"c2\"]]")

  putStrLn ""
  putStrLn("\t" ++ "doBuildEqs1 (c1,c2) [] [[c1],[c5,c6]]")
  let z = doBuildEqs1 ("c1","c2") [] [["c1"],["c5","c6"]]
  putStrLn("\t" ++ "Actual:   " ++  (show z))
  putStrLn("\t" ++ "Expected: " ++ "[[\"c1\",\"c2\"],[\"c5\",\"c6\"]]")

  putStrLn ""
  putStrLn("\t" ++ "doBuildEqs1 (c1,c2) [[c7,c8],[c9]] [[c1],[c5,c6]]")
  let z = doBuildEqs1 ("c1","c2") [["c7","c8"],["c9"]] [["c1"],["c5","c6"]]
  putStrLn("\t" ++ "Actual:   " ++  (show z))
  putStrLn("\t" ++ "Expected: " ++
   "[[\"c7\",\"c8\"],[\"c9\"],[\"c1\",\"c2\"],[\"c5\",\"c6\"]]")

  putStrLn ""
  putStrLn("\t" ++ "doBuildEqs1 (c1,c2) [] [[c2],[c5,c6]]")
  let z = doBuildEqs1 ("c1","c2") [] [["c2"],["c5","c6"]]
  putStrLn("\t" ++ "Actual:   " ++  (show z))
  putStrLn("\t" ++ "Expected: " ++ "[[\"c2\",\"c1\"],[\"c5\",\"c6\"]]")

  putStrLn ""
  putStrLn("\t" ++ "doBuildEqs1 (c1,c2) [[c7,c8],[c9]] [[c2],[c5,c6]]")
  let z = doBuildEqs1 ("c1","c2") [["c7","c8"],["c9"]] [["c2"],["c5","c6"]]
  putStrLn("\t" ++ "Actual:   " ++  (show z))
  putStrLn("\t" ++ "Expected: " ++
   "[[\"c7\",\"c8\"],[\"c9\"],[\"c2\",\"c1\"],[\"c5\",\"c6\"]]")

  putStrLn ""
  putStrLn("\t" ++ "let z = doBuildEqs1 (\"c1\",\"c2\") [] []")
  let z = doBuildEqs1 ("c1","c2") [] []
  putStrLn("\t" ++ "Actual:   " ++  (show z))
  putStrLn("\t" ++ "Expected: " ++ "[[\"c1\",\"c2\"]]")

  putStrLn ""
  putStrLn("\t" ++ "let zz = doBuildEqs1 (\"c4\",\"c5\") [] z")
  let zz = doBuildEqs1 ("c4","c5") [] z
  putStrLn("\t" ++ "Actual:   " ++  (show zz))
  putStrLn("\t" ++ "Expected: " ++ "[[\"c1\",\"c2\"],[\"c4\",\"c5\"]]")

  putStrLn ""
  putStrLn("\t" ++ "let zzz = doBuildEqs1 (\"c5\",\"c6\") [] zz")
  let zzz = doBuildEqs1 ("c5","c6") [] zz
  putStrLn("\t" ++ "Actual:   " ++  (show zzz))
  putStrLn("\t" ++ "Expected: " ++ "[[\"c1\",\"c2\"],[\"c4\",\"c5\",\"c6\"]]")

  putStrLn "End unitTest"
  putStrLn ""

  let m=Data.Set.fromList ["c0","c1","c2"]
  let n0=[["c0","c10"],["c1","c11","c12"],["c2","c22"],["c99","c98"]]
  let n= fmap (Data.Set.fromList) n0

  let (m1,a1) = mergeSets1 m n []
  putStrLn ""
  putStrLn("(m1,a1) = mergeSets m n []")
  putStrLn("\twhere m = " ++ (show m))
  putStrLn("\t      n = " ++ (show n))
  putStrLn ""
  putStrLn("m1: " ++ (show m1))
  putStrLn("a1: " ++ (show a1))

  let m=Data.Set.fromList ["c0","c1","c2","c4"]
  let n0=[["c0","c1","c2","c4"],["c3","c4"]]
  let n= fmap (Data.Set.fromList) n0

  let (m1,a1) = mergeSets1 m n []
  putStrLn ""
  putStrLn("(m1,a1) = mergeSets m n []")
  putStrLn("\twhere m = " ++ (show m))
  putStrLn("\t      n = " ++ (show n))
  putStrLn ""
  putStrLn("m1: " ++ (show m1))
  putStrLn("a1: " ++ (show a1))

  let m=Data.Set.fromList ["c0","c1","c2","c4"]
  let n0=[["c0","c1","c2","c4"],["c3","c4"],["c5","c6"]]
  let n= fmap (Data.Set.fromList) n0

  let (m1,a1) = mergeSets1 m n []
  putStrLn ""
  putStrLn("(m1,a1) = mergeSets m n []")
  putStrLn("\twhere m = " ++ (show m))
  putStrLn("\t      n = " ++ (show n))
  putStrLn ""
  putStrLn("m1: " ++ (show m1))
  putStrLn("a1: " ++ (show a1))
 else do
  return ()

-- End Unit Testing

 args <- getArgs
 let f0 = args!!0 -- file name of table.column pairs in csv
 
 hin0 <- openFile f0 ReadMode
 
 inStr0 <- hGetContents hin0

 let fline0 = lines inStr0

 if debug
 then do
  putStrLn ""
  putStrLn "debug"
  putStrLn("File \"" ++ f0 ++ "\" dump:")
  dumpLines fline0 (length fline0) 0
 else do
  return ()

 let eqs = mkPairs fline0 [] (length fline0) 0

 if debug
 then do
  putStrLn ""
  putStrLn "debug"
  putStrLn ("pairs: " ++ (show eqs))
 else do
  return ()

 let firstSplit = doBuild eqs

 if debug
 then do
  putStrLn ""
  putStrLn "debug"
  putStrLn("firstSplit: " ++ (show firstSplit))
 else do
  return ()

 let firstSet = fmap Data.Set.fromList firstSplit

 if debug
 then do
  putStrLn ""
  putStrLn "debug"
  putStrLn("firstSet: " ++ (show firstSet))
 else do
  return ()

 let firstSet' = mergeSets firstSet []

 if debug
  then do
   putStrLn ""
   putStrLn "debug"
   putStrLn("firstSet' = mergeSets firstSet []")
   putStrLn("\twhere firstSet = " ++ (show firstSet))
   putStrLn("firstSet': " ++ (show firstSet'))
 else do
  return ()

 let result = fmap Data.Set.toList firstSet'

 if debug
  then do
   putStrLn ""
   putStrLn "debug"
   putStrLn("result: " ++ (show result))
 else do
  return ()

-- putStrLn(f0 ++ ": " ++ (show result))

 pPretty result

 hClose hin0

pPretty [] = 
 do
  return()

pPretty (x:xs) =
 do
  pPrettyGroup x
  pPretty xs

pPrettyGroup [] = 
 do
  putStrLn ""

pPrettyGroup (x:xs) =
 let s = x in
  pPrettyGroup' xs s

pPrettyGroup' [] s =
 do
  putStrLn s

pPrettyGroup' (x:xs) s =
 let z = s ++ "," ++ x in
  pPrettyGroup' xs z

mergeSets :: Ord a => [Set a] -> [Set a] -> [Set a]
mergeSets [] a = a

mergeSets (z:zs) a =
 let (z',a') = mergeSets1 z zs [] in
  mergeSets a' (z':a)

mergeSets1 :: Ord a => Set a -> [Set a] -> [Set a] -> (Set a, [Set a])
mergeSets1 m [] a = (m,a)

mergeSets1 m (n:ns) a =
 let (m',h) = mergeSet m n in
  if h == True
  then
   mergeSets1 m' ns a
  else
   mergeSets1 m' ns (n:a)
 
mergeSet :: Ord a => Set a -> Set a -> (Set a, Bool)
mergeSet m n =
 let o = Data.Set.intersection m n in
  if (length o) > 0
  then
   ((Data.Set.union m n), True)
  else
   (m, False)

mkPairs f s l i =
 if l == i
 then
  s
 else
  let x = splitOn "," (f!!i) in
   let a = (x!!0) in
    let b = (x!!1) in
     mkPairs f (s ++ [(a,b)]) l (i+1)

doBuild :: Eq t => [(t,t)] -> [[t]]
doBuild (z:zs) =
 doBuild1 zs (doBuildEqs1 z [] [])

doBuild1 :: Eq t => [(t,t)] -> [[t]] -> [[t]]
doBuild1 [] a = a

doBuild1 (z:zs) a =
 doBuild1 zs (doBuildEqs1 z [] a)
 
doBuildEqs1 :: Eq t => (t,t) -> [[t]] -> [[t]] -> [[t]]
doBuildEqs1 (x,y) a [] =
  let z = doBuildEqs0 (x,y) in
   a ++ [z]

doBuildEqs1 (x,y) a (z:zs) =
 let (zz,h) = doBuildEq (x,y) z in
  if h == True
  then
   a ++ [zz] ++ zs
  else
   doBuildEqs1 (x,y) (a++[z]) zs

doBuildEqs0 :: Eq t => (t,t) -> [t]
doBuildEqs0 (x,y) = [x,y]

doBuildEq :: Eq t => (t,t) -> [t] -> ([t],Bool)
doBuildEq (x,y) z =
 if (elem x z) == True
  then
   if (elem y z) == False
   then
    ((z ++ [y]), True)
   else
    (z, True)
 else if (elem y z) == True
  then
   ((z ++ [x]), True)
  else
   (z, False)

dumpLines f l i = do
 if l == i
 then do
  return ()
 else do
  putStrLn (f!!i)
  dumpLines f l (i+1)
