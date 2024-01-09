from Funktionen import save_data
from Funktionen import get_params


# get_params(): Drucke den Parameterraum einer Eurostat-Statistik in der Konsole
# save_data(): Speichere einen Eurostat-NUTS-Datensatz unter Daten/

get_params("TRAN_R_RAGO")

# Wertschöpfung
save_data("BIP", "NAMA_10R_2GDP", {"unit": "MIO_EUR"})
save_data("BIP_KKS_proKopf", "TGS00005")
save_data("BIP_KKS", "TGS00004")
save_data("BIP_proKopf", "NAMA_10R_2GDP", {"unit": "EUR_HAB"})
save_data("BWS_Vol", "NAMA_10R_2GVAGR", {"na_item": "B1G", "unit": "I15"})
save_data("BIP_Vol", "NAMA_10R_2GVAGR", {"na_item": "B1GQ", "unit": "I15"})

# Wirtschaftliche Strukturdaten - Gesamt und im Verarbeitenden Gewerbe
save_data("Arbeitsstunden_proErwerbstaetigen", "NAMA_10R_2LP10", {"nace_r2": "TOTAL", "na_item": "HW_EMP", "unit": "HW"})
save_data("Arbeitsstunden_geleistet", "NAMA_10R_2EMHRW", {"wstatus": "EMP", "nace_r2": "TOTAL"})
save_data("Arbeitnehmerentgelt", "NAMA_10R_2COE", {"currency": "MIO_EUR", "nace_r2": "TOTAL"})
save_data("Entgelt_proH", "NAMA_10R_2LP10", {"nace_r2": "TOTAL", "na_item": "D1_SAL_HW", "unit": "EUR"})
save_data("Entgelt_proKopf", "NAMA_10R_2LP10", {"nace_r2": "TOTAL", "na_item": "D1_SAL_PER", "unit": "EUR"})
save_data("Arbeitsproduktivitaet_proErwerbstaetigen_nom", "NAMA_10R_2NLP", {"na_item": "NLPR_PER", "unit": "EUR"})
save_data("Arbeitsproduktivitaet_proH_nom", "NAMA_10R_2NLP", {"na_item": "NLPR_HW", "unit": "EUR"})
save_data("Arbeitsproduktivitaet_proErwerbstaetigen_real", "NAMA_10R_2RLP", {"na_item": "RLPR_PER", "unit": "I15"})
save_data("Arbeitsproduktivitaet_proH_real", "NAMA_10R_2RLP", {"na_item": "RLPR_HW", "unit": "I15"})
save_data("Anlageninvestition", "NAMA_10R_2GFCF", {"currency": "MIO_EUR", "nace_r2": "TOTAL"})

save_data("StrukturVG_UntZahl", "SBS_R_NUTS06_R2", {"nace_r2": "C", "indic_sb": "V11210"})
save_data("StrukturVG_BeschZahl", "SBS_R_NUTS06_R2", {"nace_r2": "C", "indic_sb": "V16110"})
save_data("Beschaeftigtenanteil_VG", "HTEC_EMP_REG2", {"nace_r2": "C", "unit": "PC_EMP", "sex": "T"})
save_data("Arbeitsstunden_geleistetVG", "NAMA_10R_2EMHRW", {"wstatus": "EMP", "nace_r2": "C"})
save_data("StrukturVG_Lohn", "SBS_R_NUTS06_R2", {"nace_r2": "C", "indic_sb": "V13320"})
save_data("Arbeitnehmerentgelt_VG", "NAMA_10R_2COE", {"currency": "MIO_EUR", "nace_r2": "C"})
save_data("Entgelt_proHVG", "NAMA_10R_2LP10", {"nace_r2": "C", "na_item": "D1_SAL_HW", "unit": "EUR"})
save_data("AnlageninvestitionVG", "NAMA_10R_2GFCF", {"currency": "MIO_EUR", "nace_r2": "C"})

# Einkommen
save_data("Primaereinkommen", "NAMA_10R_2HHINC", {"direct": "BAL", "unit": "EUR_HAB", "na_item": "B5N"})
save_data("VerfuegbaresEinkommen_Ausgaben", "NAMA_10R_2HHINC", {"direct": "BAL", "unit": "EUR_HAB", "na_item": "B6N"})
save_data("Betriebsueberschuss", "NAMA_10R_2HHINC", {"direct": "BAL", "unit": "MIO_EUR", "na_item": "B2A3N"})
save_data("Arbeitnehmerentgelt_Einkommen", "NAMA_10R_2HHINC", {"direct": "RECV", "unit": "MIO_EUR", "na_item": "D1"})
save_data("Vermoegenseinkommen", "NAMA_10R_2HHINC", {"direct": "RECV", "unit": "MIO_EUR", "na_item": "D4"})
save_data("Sozialleistungen", "NAMA_10R_2HHINC", {"direct": "RECV", "unit": "MIO_EUR", "na_item": "D62"})
save_data("SonstTransfers", "NAMA_10R_2HHINC", {"direct": "RECV", "unit": "MIO_EUR", "na_item": "D7"})
save_data("Einkommens_Vermoegenssteuern", "NAMA_10R_2HHINC", {"direct": "PAID", "unit": "MIO_EUR", "na_item": "D5"})
save_data("Sozialbeitraege", "NAMA_10R_2HHINC", {"direct": "PAID", "unit": "MIO_EUR", "na_item": "D61"})

# Bevölkerungsstruktur
save_data("Einwohnerzahl", "DEMO_R_D2JAN", {"sex": "T", "age": "TOTAL"})
save_data("Haushalte", "LFST_R_LFSD2HH", {"deg_urb": "TOTAL"})
save_data("Haushalte_Stadt", "LFST_R_LFSD2HH", {"deg_urb": "DEG1"})
save_data("Bevoelkerungsdichte", "TGS00024")
save_data("Bevoelkerungsveraenderung_Rate", "TGS00099", {"indic_de": "GROWRT"})
save_data("NatBevoelkerungsveraenderung_Rate", "TGS00099", {"indic_de": "NATGROWRT"})
save_data("Wanderungssaldo_Rate", "TGS00099", {"indic_de": "CNMIGRATRT"})
save_data("Medianalter", "DEMO_R_PJANIND2", {"indic_de": "MEDAGEPOP", "unit": "YR"})
save_data("Frauenquotient", "DEMO_R_PJANIND2", {"indic_de": "PC_FM", "unit": "PC"})
save_data("Jugendquotient", "DEMO_R_PJANIND2", {"indic_de": "YOUNGDEP1", "unit": "PC"})
save_data("Altenquotient", "DEMO_R_PJANIND2", {"indic_de": "OLDDEP1", "unit": "PC"})
save_data("Altersabhaengigkeitsquotient", "DEMO_R_PJANIND2", {"indic_de": "DEPRATIO1", "unit": "PC"})

# Sozioökonomische Daten
save_data("Lebenserwartung", "TGS00101", {"sex": "T"})
save_data("Geburtenrate", "TGS00100")
save_data("Armutsgefaehrdung", "TGS00103")
save_data("Auspendler", "LFST_R_LFE2ECOMM", {"age": 'Y15-64', "c_work": "OUTR", "sex": "T"})
save_data("Weiterbildung", "TRNG_LFSE_04", {"sex": "T"})
save_data("Tertiaere_Bildung", "HRST_ST_RCAT", {"unit": "PC_POP", "category": "HRST"})

# FuE
save_data("FuEAusgaben", "TGS00042")
save_data("Forscher", "RD_P_PERSREG", {"prof_pos": "TOTAL", "sex": "T", "sectperf": "TOTAL", "unit": "PC_ACT_FTE"})
save_data("Forscher_Unternehmen", "RD_P_PERSREG", {"prof_pos": "TOTAL", "sex": "T", "sectperf": "BES", "unit": "PC_ACT_FTE"})
save_data("Forscher_Hochschule", "RD_P_PERSREG", {"prof_pos": "TOTAL", "sex": "T", "sectperf": "HES", "unit": "PC_ACT_FTE"})
save_data("Forscher_Staat", "RD_P_PERSREG", {"prof_pos": "TOTAL", "sex": "T", "sectperf": "GOV", "unit": "PC_ACT_FTE"})

# Arbeitsmarkt
save_data("Erwerbstaetige", "LFST_R_LFE2EFTPT", {"worktime": "TOTAL", "wstatus": "EMP", "age": "Y15-64", "sex": "T"})
save_data("Erwerbstaetigenquote", "TGS00007", {"sex": "T"})
save_data("Erwerbstaetige_Teilzeit", "LFST_R_LFE2EFTPT", {"worktime": "PT", "wstatus": "EMP", "age": "Y15-64", "sex": "T"})
save_data("Erwerbstaetigenquote_Frauen", "LFST_R_LFE2EMPRC", {"c_birth": "TOTAL", "isced11": "TOTAL", "age": "Y15-64", "sex": "F"})
save_data("Erwerbstaetigenquote_Maenner", "LFST_R_LFE2EMPRC", {"c_birth": "TOTAL", "isced11": "TOTAL", "age": "Y15-64", "sex": "M"})
save_data("Erwerbstaetigenquote_Bildung02", "LFST_R_LFE2EMPRC", {"c_birth": "TOTAL", "isced11": "ED0-2", "age": "Y15-64", "sex": "T"})
save_data("Erwerbstaetigenquote_Bildung34", "LFST_R_LFE2EMPRC", {"c_birth": "TOTAL", "isced11": "ED3_4", "age": "Y15-64", "sex": "T"})
save_data("Erwerbstaetigenquote_Bildung58", "LFST_R_LFE2EMPRC", {"c_birth": "TOTAL", "isced11": "ED5-8", "age": "Y15-64", "sex": "T"})
save_data("Erwerbstaetigenquote_Inlaender", "LFST_R_LFE2EMPRC", {"c_birth": "NAT", "isced11": "TOTAL", "age": "Y15-64", "sex": "T"})
save_data("Erwerbstaetigenquote_Auslaender", "LFST_R_LFE2EMPRC", {"c_birth": "FOR", "isced11": "TOTAL", "age": "Y15-64", "sex": "T"})
save_data("Jugenderwerbstaetigenquote", "YTH_EMPL_030", {"sex": "T", "age": "Y15-24"})
save_data("Erwerbspersonen", "LFST_R_LFP2ACEDU", {"sex": "T", "age": "Y_GE15", "isced11": "TOTAL"})
save_data("Erwerbspersonen_Frauen", "LFST_R_LFP2ACEDU", {"sex": "F", "age": "Y_GE15", "isced11": "TOTAL"})
save_data("Erwerbspersonen_Maenner", "LFST_R_LFP2ACEDU", {"sex": "M", "age": "Y_GE15", "isced11": "TOTAL"})
save_data("Erwerbspersonen_Bildung02", "LFST_R_LFP2ACEDU", {"sex": "T", "age": "Y_GE15", "isced11": "ED0-2"})
save_data("Erwerbspersonen_Bildung34", "LFST_R_LFP2ACEDU", {"sex": "T", "age": "Y_GE15", "isced11": "ED3_4"})
save_data("Erwerbspersonen_Bildung58", "LFST_R_LFP2ACEDU", {"sex": "T", "age": "Y_GE15", "isced11": "ED5-8"})
save_data("Arbeitslosenquote", "LFST_R_LFU3RT", {"isced11": "TOTAL", "age": "Y15-74", "sex": "T"})
save_data("Arbeitslosenquote_Frauen", "LFST_R_LFU3RT", {"isced11": "TOTAL", "age": "Y15-74", "sex": "F"})
save_data("Arbeitslosenquote_Maenner", "LFST_R_LFU3RT", {"isced11": "TOTAL", "age": "Y15-74", "sex": "M"})
save_data("Arbeitslosenquote_Bildung02", "LFST_R_LFU3RT", {"isced11": "ED0-2", "age": "Y15-74", "sex": "T"})
save_data("Arbeitslosenquote_Bildung34", "LFST_R_LFU3RT", {"isced11": "ED3_4", "age": "Y15-74", "sex": "T"})
save_data("Arbeitslosenquote_Bildung58", "LFST_R_LFU3RT", {"isced11": "ED5-8", "age": "Y15-74", "sex": "T"})
save_data("Arbeitsmarktpotential", "LFST_R_SLA_GA", {"age": "Y_GE15", "sex": "T", "unit": "PC_ELF"})
save_data("Arbeitsmarktpotential_Frauen", "LFST_R_SLA_GA", {"age": "Y_GE15", "sex": "F", "unit": "PC_ELF"})
save_data("Arbeitsmarktpotential_Maenner", "LFST_R_SLA_GA", {"age": "Y_GE15", "sex": "M", "unit": "PC_ELF"})
save_data("Arbeitsmarktnachfrage_IKT", "ISOC_SK_OJA1")
save_data("Arbeitszeit", "LFST_R_LFE2EHOUR", {"age": "Y15-64", "sex": "T"})
save_data("Langzeitbeschaeftigung", "LFST_R_EGAD", {"unit": "PC", "duration": "M_GE60", "age": "Y15-64"})
save_data("Geschlechterbeschaeftigung", "TEPSR_LM220")

# Infrastruktur
save_data("Personenluftverkehrsleistung", "TRAN_R_AVPA_NM", {"tra_meas": "PAS_CRD"})
save_data("Luftfrachtverkehr", "TRAN_R_AVGO_NM", {"tra_meas": "FRM_LD_NLD"})
