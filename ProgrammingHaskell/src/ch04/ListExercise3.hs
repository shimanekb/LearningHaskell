import System.Environment (getArgs)
  
main = mainWith myFunction
  where mainWith function = do
          args <- getArgs
          case args of
            [text] -> putStrLn (head (words text))
            _ -> putStrLn "error: needs text"
             
             
        -- replace "id" with the same of our function below
        myFunction = id