{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wno-missing-methods #-}

module Years where

import Data.Coerce

newtype Months = Months Integer
  deriving (Eq, Show, Num, Integral, Enum, Ord, Real)

newtype Years = Years Integer
  deriving (Eq, Show, Num, Integral, Enum, Ord, Real)

instance {-# INCOHERENT #-} t ~ Years
  => Num ((Integer -> Years) -> t) where
  fromInteger i toYears = toYears i

instance Num ((Integer -> Years) -> Months) where
  fromInteger i toYears = coerce $ toYears i * 12

instance {-# INCOHERENT #-} t ~ Months
  => Num ((Integer -> Months) -> t) where
  fromInteger i toMonths = toMonths i

instance Num ((Integer -> Months) -> Years) where
  fromInteger i toMonths = coerce $ toMonths i `div` 12
