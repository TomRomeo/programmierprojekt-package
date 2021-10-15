@AbapCatalog.sqlViewName: 'ZI09BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View Booking'
@VDM.viewType: #BASIC
define view ZI_09_Booking
  as select from sbook
{
  key carrid                             as CarrierID,
  key connid                             as ConnectionID,
  key fldate                             as FlightDate,
  key bookid                             as BookingID,
      customid                           as CustomerID,
      custtype                           as CustomerType,
      smoker                             as IsSmoker,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      luggweight                         as LuggageWeight,
      @Semantics.unitOfMeasure: true
      wunit                              as WeightUnit,
      invoice                            as Invoice,
      class                              as FlightClass,
      @Semantics.amount.currencyCode: 'Currency'
      currency_conversion(
      amount => forcuram,
      source_currency => forcurkey,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => order_date ) as Amount,
      @Semantics.currencyCode: true
      cast('EUR' as abap.cuky)           as Currency,
      order_date                         as OrderDate,
      counter                            as Counter,
      agencynum                          as Agencynum,
      cancelled                          as IsCancelled,
      reserved                           as Reserved,
      passname                           as Passname,
      passform                           as Passform,
      passbirth                          as Passbirth
}
