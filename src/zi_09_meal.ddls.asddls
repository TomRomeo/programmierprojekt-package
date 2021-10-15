@AbapCatalog.sqlViewName: 'ZI09MEAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View Meal'
@VDM.viewType: #BASIC
define view ZI_09_MEAL
  as select from smealt
{
  key carrid     as CarrierID,
  key mealnumber as Mealnumber,
  key sprache    as Sprache,
      text       as Text
}
