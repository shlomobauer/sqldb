module Main where
import Sysgenparse
import Sysgenlex
import Treedef
import Treepr
import Eqpr

import System.Environment
import System.IO

main = do 
 let showTokens = False
 let showParseTree = False
 let showPrettyPrintParseTree = False

 args <- getArgs
 let fname = args!!0
 inh <- openFile fname ReadMode
 inStr <- hGetContents inh

 if showTokens
 then do
  putStrLn("Tokens:")
  print (alexScanTokens inStr)
  putStrLn ""
 else do
  return ()

 let parseTree =  sysgenparse (alexScanTokens inStr)

 if showParseTree
 then do
  putStrLn("Parse Tree:")
  print parseTree
  putStrLn ""
 else do
  return ()

 if showPrettyPrintParseTree
 then do
  ptreeStmtList parseTree
  putStrLn ""
 else do
  return ()

 ptreeEq parseTree

 hClose inh
