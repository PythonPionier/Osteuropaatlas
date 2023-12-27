import eurostat
import pandas


def get_params(code: str) -> None:
    """
    Auslesen des Parameterraumes eines eurostat Datensatzes.
    :param code: str, Kodierung des eurostat Datensatzes
    :return: None
    """

    print(f"Lade die Parameter für Eurostat Datensatz {code}")

    # Lade alle Parameter
    code_parameter = eurostat.get_pars(code=code)

    # Für jeden Parameter: Lade alle Optionen
    for parameter in code_parameter:
        par_values = eurostat.get_par_values(code=code, par=parameter)
        print(f"{parameter}: {par_values}")


def get_data(code: str, filters: dict = dict()) -> pandas.DataFrame:
    """
    Auslesen eines Eurostat Datensatzes.
    :param code: str, Kodierung des Eurostat Datensatzes
    :param filters: dict, Parameterraum, der von get_params ausgegeben wird
    :return: pandas.DataFrame
    """

    # Lade den Datensatz
    print(f"Lade Datensatz {code} mit Filtern {filters}...")
    data = eurostat.get_data_df(code=code, filter_pars=filters)
    data.rename(columns={r"geo\TIME_PERIOD": "geo"}, inplace=True)
    print("...fertig!")

    return data


def save_data(xlsx: str, code: str, filters: dict) -> None:
    """
    Speichern eines Eurostat Datensatzes als Excel-Datei
    :param xlsx: str, Name der Excel Datei
    :param code: str, Kodierung des Eurostat Datensatzes
    :param filters: dict, Parameterraum, der von get_params ausgegeben wird
    :return: None
    """
    data: pandas.DataFrame = get_data(code, filters)
    with pandas.ExcelWriter(path=f"Daten/{xlsx}_{code}.xlsx") as writer:
        data.to_excel(writer, index=False, sheet_name="Daten")
