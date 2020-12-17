-- Pillbox hospital: 307.1680, -590.807, 43.280

exports('GetPillboxHospitalObject', function()
    return PillboxHospital
end)

PillboxHospital = {
    ipl = "rc12b_fixed",
    ipl = "rc12b_destroyed",
    ipl = "rc12b_default",
    ipl = "rc12b_hospitalinterior_lod",
    ipl = "rc12b_hospitalinterior",

    Enable = function(state)
        RemoveIpl(PillboxHospital.ipl, state)
    end
}
