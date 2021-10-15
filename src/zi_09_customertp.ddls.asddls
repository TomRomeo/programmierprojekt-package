@AbapCatalog.sqlViewName: 'ZI09CUSTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@EndUserText.label: 'Transactional View Customer'
@VDM.viewType: #TRANSACTIONAL
define view ZI_09_CUSTOMERTP
  as select from ZI_09_CUSTOMER
  association [0..*] to ZI_09_BookingTP as _Booking on $projection.ID = _Booking.CustomerID
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
      case when CustomerType = 'B' then 'Business'
           when CustomerType = 'P' then 'Privat'
           else 'unknown' end as CustomerType,
      Discount,
      Language,
      EMail,
      Webuser,
      concat_with_space(Form, Name, 1) as FormName,
      concat_with_space(concat_with_space(concat(Street, ','), concat(Postcode, ','), 1), concat_with_space(concat(City, ','), Country, 1), 1) as Address,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Booking
}
