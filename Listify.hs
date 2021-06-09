{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module Listify where

ex0 :: Maybe Int
ex0 = listify (+) [1, 2]

ex1 ::  Maybe Int
ex1 = listify (+) [1]

ex2 ::  Maybe (Triple String)
ex2 = listify Triple ["h", "el", "lo"]

ex3 ::  Maybe (Triple Int)
ex3 = listify Triple [20, 30, 40]

data Triple a = Triple a a a
  deriving (Eq, Show)

class Listable input element output where
  listify :: input -> [element] -> Maybe output

instance (head ~ element, Listable input element output)
  => Listable (head -> input) element output where
  listify f = \case
    [] -> Nothing
    x : xs -> listify (f x) xs

instance {-# INCOHERENT #-} (input ~ output)
  => Listable input element output where
  listify x _ = Just x
