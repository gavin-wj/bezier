
--求贝塞尔曲线上的点
function BezierPoint(t, p)
    local u = 1.0 - t
	local n = #p - 1
	local _p = Vector3.zero
	for i = 0, n, 1 do
		_p = _p + p[i + 1] * Combination(n, i) * math.pow(u, n - i) * math.pow(t, i)
	end
    return _p
end

--对贝塞尔曲线求导，获得某个点在曲线上的斜率
function BezierTangent(t, p)

	local u = 1.0 - t
	local n = #p - 1
	local k = p[1] * n * math.pow(u, n-1) * (-1)
	for i = 1, n - 1, 1 do
		k = k + p[i + 1] * Combination(n, i) * (i * math.pow(t, i - 1) * math.pow(u, n - i) + (n - i) * math.pow(t, i) * math.pow(u, n - i - 1) * (-1))
	end
	k = k + p[n + 1] * n * math.pow(t, n - 1)
	return k.normalized;
end

--求组合数n!/((n-m)! * m!)
function Combination(n, m)
	if m == 0 then
		return 1
	end
	
	local c1 = 1
	local c2 = 1
	for i = n, n - m + 1, -1 do
		c1 = c1 * i
	end
	for i = m, 1, -1 do
		c2 = c2 * i
	end
	return c1 / c2
end

