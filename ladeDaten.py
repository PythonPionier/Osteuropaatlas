from Funktionen import save_data
from Funktionen import get_params


get_params("NAMA_10R_2EMHRW")
save_data(xlsx="Arbeitsstunden", code="NAMA_10R_2EMHRW", filters={"wstatus": "EMP", "nace_r2": "C"})
