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

ex2 ::  Maybe Triad
ex2 = listify Triad ["h", "el", "lo"]

data Triad = Triad String String String
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
