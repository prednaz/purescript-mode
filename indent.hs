-------------------------------------------------------------------------
-- Comments with allcaps `FIXME' indicate places where the indentation --
-- fails to find the correct indentation, whereas comments with        --
-- lowercase `fixme' indicate places where impossible indentations     --
-- are uselessly proposed.                                             --
-------------------------------------------------------------------------

-- compute the list of binary digits corresponding to an integer
-- Note: the least significant bit is the first element of the list
bdigits               :: Int -> [Int]
bdigits 0             = [0]
bdigits 1             = [1]
bdigits n | n>1       = n `mod` 2 :
                        bdigits (n `div` 2)
          | otherwise = error "bdigits of a negative number"

--  compute the value of an integer given its list of binary digits
--  Note: the least significant bit is the first element of the list
bvalue :: [Int]->Int
bvalue [] = error "bvalue of []"
bvalue s  = bval 1 s
    where
      bval e [] = 0
      bval e (b:bs) | b==0 || b=="dd of " = b*e + bval (2*e) bs
                    | otherwise    = error "illegal digit" -- Spurious 3rd step.
                                     foo

-- fixme: tab on the line above should insert `bvalue' at some point.

{- text
   indentation
   inside comments
 -}
toto a = ( hello
         , there                -- indentation of leading , and ;
         -- indentation of this comment.
         , my friends )

lili x = do let ofs x = 1
            print x

titi b =
    let                         -- fixme: can't indent at column 0
        x = let toto = 1
                tata = 2        -- fixme: can't indent lower than `toto'.
            in
                toto
    in
    do expr1
       {- text
        - indentation
        - inside comments
        -}
       let foo s  = let fro = 1
                        fri = 2   -- fixme: can't indent lower than `fro'.
                    in
                        hello
           foo2 = bar2  -- fixme: can't align with arg `s' in foo.
           foo1 = bar2  -- fixme: Can't be column 0.
       expr2

tata c =
    let bar = case foo
              of 1 -> blabla
                 2 -> blibli    -- fixme: only one possible indentation here.
        bar = case foo of
                _ -> blabla
        bar' = case foo
               of _ -> blabla
                  toto -> plulu
    
turlu d = if test
          then
              ifturl
          else
              adfaf

turlu d = if test then
              ifturl
          else
              sg

turly fg = toto
    where
      hello = 2
           

-- test from John Goerzen

x myVariableThing = case myVariablething of
                      Just z -> z
                      Nothing -> 0 -- fixme: "spurious" additional indents.

foo = let x = 1 in toto
                       titi     -- FIXME

foo = let foo x y = toto
              where
                toto = 2

instance Show Toto where
    foo x 4 = 50
         
data Toto = Foo
          | Bar
          deriving (Show)     -- FIXME

foo = let toto x = do let bar = 2
                      return 1
      in 3                      -- FIXME

eval env (Llambda x e) =    -- FIXME: sole indentation is self???
    Vfun (\v -> eval (\y -> if (x == y) then v else env y) -- FIXME
                     e) -- FIXME

foo = case findprop attr props of
        Just x -> x


data T = T { granularity :: (Int, Int, Int, Int) -- FIXME: self indentation?
            , items :: Map (Int, Int, Int, Int) [Item] }

-- arch-tag: de0069e3-c0a0-495c-b441-d4ff6e0509b1
