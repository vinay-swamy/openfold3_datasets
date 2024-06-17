#%%
from rcsbsearchapi.search import TextQuery, AttributeQuery, Facet

### EVALUATION SET
# get between date range
q = AttributeQuery("rcsb_accession_info.initial_release_date", operator="greater_or_equal", value="2022-05-01").and_(
 AttributeQuery("rcsb_accession_info.initial_release_date", operator="less_or_equal", value="2023-01-12")
)
print(q.count()) ## expected: 10192, actual: 10172
## filter by resolution and experimental method(remove NMR)
q = q.and_(
    AttributeQuery("rcsb_entry_info.resolution_combined", operator="less_or_equal", value=4.5)
).and_(
    AttributeQuery("exptl.method", operator="exact_match", value="NMR", negation=True)
)
print(q.count()) ## expected: 9636, actual: 9636 
