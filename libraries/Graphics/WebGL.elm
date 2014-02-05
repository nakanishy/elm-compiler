module Graphics.WebGL (link, mapTriangle, zipTriangle, bind, encapsulate, webgl) where

{-| WebGL -}

import Graphics.Element (Element)
import Native.Graphics.WebGL

data Shader a u v = Dummy_Shader
data Program a u = Dummy_Program

link : Shader a u v -> Shader {} {} v -> Program a u
link = Native.Graphics.WebGL.link

type Triangle a = (a,a,a)

triangle : a -> a -> a -> Triangle a
triangle = (,,)

mapTriangle : (a -> b) -> Triangle a -> Triangle b
mapTriangle f (x,y,z) = (f x, f y, f z)

zipTriangle : (a -> b -> c) -> Triangle a -> Triangle b -> Triangle c
zipTriangle f (x,y,z) (x',y',z') = (f x x', f y y', f z z')

data Buffer a = Dummy_Buffer

bind : [Triangle a] -> Buffer a
bind = Native.Graphics.WebGL.bind

data Model = Dummy_Model 

encapsulate : Program a u -> Buffer a -> u -> Model
encapsulate = Native.Graphics.WebGL.encapsulate

webgl : (Int,Int) -> [Model] -> Element
webgl = Native.Graphics.WebGL.webgl
