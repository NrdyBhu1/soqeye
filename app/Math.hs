module Math where

rectCollidesCircle :: (Int, Int, Int, Int) -> (Int, Int, Int) -> Bool
rectCollidesCircle (rx, ry, rw, rh) (cx, cy, cr) = False

rectCollidesRect :: (Int, Int, Int, Int) -> (Int, Int, Int, Int) -> Bool
rectCollidesRect (r1x, r1y, r1w, r1h) (r2x, r2y, r2w, r2h) = r1x < r2x + r2w && r1x + r1w > r2x && r1y < r2y + r2h && r1y + r1h > r2y 
