# A class of Matern isotropic functions including the Matrern 3/2 and 5/2, where d= 3 or 5. Also the exponential function, where d=1

include("mat12_iso.jl")
include("mat12_ard.jl")

include("mat32_iso.jl")
include("mat32_ard.jl")

include("mat52_iso.jl")
include("mat52_ard.jl")

@doc """
# Description
Constructor the Matern kernel

# See also
Mat12Iso, Mat12Ard, Mat32Iso, Mat32Ard, Mat52Iso, Mat52Ard
""" ->
function Mat(d::Int,ll::Float64, lσ::Float64)
    if d==1
        kern = Mat12Iso(ll, lσ)
    elseif d==3
        kern = Mat32Iso(ll, lσ)
    elseif d==5
        kern = Mat52Iso(ll, lσ)
    else throw(ArgumentError("For the Matern covariance d must equal 1, 3 or 5"))
    end
    return kern
end    

function Mat(d::Int,ll::Vector{Float64}, lσ::Float64)
    if d==1
        kern = Mat12Ard(ll, lσ)
    elseif d==3
        kern = Mat32Ard(ll, lσ)
    elseif d==5
        kern = Mat52Ard(ll, lσ)
    else throw(ArgumentError("For the Matern covariance d must equal 1, 3 or 5"))
    end
    return kern
end    





