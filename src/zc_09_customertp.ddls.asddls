@AbapCatalog.sqlViewName: 'ZC09CUSTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@EndUserText.label: 'Consumption View Customer'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true

@ObjectModel: {
    //transactionalProcessingDelegated: true,

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZC_09_CUSTOMERTP
  as select from ZI_09_CUSTOMERTP
  association [0..*] to ZC_09_BookingTP as _Booking on $projection.ID = _Booking.CustomerID
{
  key ID,
      Name,
      Form,
      Street,
      Postbox,
      Postcode,
      City,
      Country,
      Region,
      Telephone,
      CustomerType,
      Discount,
      Language,
      EMail,
      Webuser,
      FormName,
      Address,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT, #TO_COMPOSITION_CHILD]
      _Booking
}
