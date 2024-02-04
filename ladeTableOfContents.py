import eurostat
import pandas

toc = eurostat.get_toc_df()
with pandas.ExcelWriter(path="TableOfContents.xlsx") as writer:
    toc.to_excel(writer, sheet_name="TOC", index=False)
    for search in ["NUTS 0", "NUTS 1", "NUTS 2", "NUTS 3", "NACE"]:
        index = toc["title"].str.contains(search)
        result: pandas.DataFrame = toc.loc[index]
        result.to_excel(writer, sheet_name=search, index=False)

