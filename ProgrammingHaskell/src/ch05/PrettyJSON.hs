import Numeric
import SimpleJSON

renderJValue :: JValue -> Doc
renderJValue (JBool True)  = text "true"
renderJValue (JBool False) = text "false"
renderJValue JNull         = text "null"
renderJValue (JNumber num) = double num
renderJValue (JString str) = String str

string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar

(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Doc
char c = undefined

hcat :: [Doc] -> Doc
hcat xs = undefined

oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
            Just r -> text r
            Nothing | mustEscape c -> hexExcape c
                    | otherwise    -> char c
        where mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'
        
simpleEscapes :: [(Char, String)]
simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrtt\\\"/"
              where ch a b = (a, ['\\',b])
              
smallHex :: Int -> Doc
smallHex x  = text "\\u"
           <> text (replicate (4 - length h) '0')
           <> text h
    where h = showHex x ""