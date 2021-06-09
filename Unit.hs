{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Unit where

-- https://lexi-lambda.github.io/blog/2021/03/25/an-introduction-to-typeclass-metaprogramming/

-- But what about incoherent instances?

class IsUnit a where
  isUnit :: Bool

instance IsUnit () where
  isUnit = True

instance IsUnit a where
  isUnit = False

-- guardUnit :: forall a. a -> Either String a
-- guardUnit x = case isUnit @a of
--   True  -> Left "unit is not allowed"
--   False -> Right x
