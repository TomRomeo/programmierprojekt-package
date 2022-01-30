@AbapCatalog.sqlViewName: 'ZI09CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@EndUserText.label: 'Interface View Customer'
@VDM.viewType: #BASIC
define view ZI_09_CUSTOMER
  as select from scustom
{
  key id        as ID,
      name      as Name,
      form      as Form,
      street    as Street,
      postbox   as Postbox,
      postcode  as Postcode,
      city      as City,
      country   as Country,
      region    as Region,
      telephone as Telephone,
      custtype  as CustomerType,
      discount  as Discount,
      langu     as Language,
      email     as EMail,
      webuser   as Webuser
}
