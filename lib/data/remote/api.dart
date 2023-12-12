import '../../libraries.dart';

final IpAddressControllerImp ipAddressController =
    Get.put(IpAddressControllerImp());

class Api {
  //*************************baseUrl***********************
  static String baseUrl = ipAddressController.ipAddress;
  //  'http://localhost/stock';
  //*************************items***********************
  static String apiAddItem = '$baseUrl/items/add.php';
  static String apiViewProdImages = '$baseUrl/items/saved';
  static String apiEditItem = '$baseUrl/items/edit.php';
  static String apiStockItem = '$baseUrl/items/stock.php';
  static String apiStockWightItem = '$baseUrl/items/wight.php';
  static String apiSubstockItem = '$baseUrl/items/substock.php';
  static String apiGetItems = '$baseUrl/items/view.php';
  static String apiGetItemsKind = '$baseUrl/items/view_kind.php';
  static String apiDeleteItem = '$baseUrl/items/delete.php';
  static String apiDeleteImage = '$baseUrl/items/delete_image.php';
  static String apiAddNewImage = '$baseUrl/items/add_new_image.php';
  //*************************Sub Stock***********************
  static String apiAddSubStockItem = '$baseUrl/substock/add.php';
  static String apiEditSubStockItem = '$baseUrl/substock/edit.php';
  static String apiStockSubStockItem = '$baseUrl/substock/stock.php';
  static String apiGetSubStockItems = '$baseUrl/substock/view.php';
  static String apiDeleteSubStockItem = '$baseUrl/substock/delete.php';
  //*************************Sup***********************
  static String apiGetCustomers = '$baseUrl/customers/view.php';
  static String apiAddCustomer = '$baseUrl/customers/add.php';
  static String apiEditCustomers = '$baseUrl/customers/edit.php';
  static String apiDeleteCustomers = '$baseUrl/customers/delete.php';
  static String apiupdateCustomerAccount = '$baseUrl/customers/account.php';

  //*************************bills Factory***********************
  static String apiGetBillsFactory = '$baseUrl/billsfactory/view.php';
  static String apiGetBillsFactoryInDate = '$baseUrl/billsfactory/date.php';
  static String apiAddBillsFactory = '$baseUrl/billsfactory/add.php';
  static String apiFactoryBillsfactory = '$baseUrl/billsfactory/edit.php';
  static String apiSaveBillsFactory = '$baseUrl/billsfactory/save.php';
  static String apiDeleteBillsFactory = '$baseUrl/billsfactory/delete.php';
  //*************************Bill Factory Item***********************
  static String apiGetBillsFactoryItems = '$baseUrl/billsfactoryitems/view.php';
  static String apiGetAllBillsfactoryitems =
      '$baseUrl/billsfactoryitems/view_all.php';
  static String addBillFactoryItem = '$baseUrl/billsfactoryitems/add.php';
  static String apiEditBillsfactoryitems =
      '$baseUrl/billsfactoryitems/edit.php';
  static String apiDeleteBillsfactoryitems =
      '$baseUrl/billsfactoryitems/delete.php';
  static String apiGetBillsFactoryitemInRange =
      '$baseUrl/billsfactoryitems/date.php';
  static String apiGetAllBillsFactoryitemsInRange =
      '$baseUrl/billsfactoryitems/date_all.php';
  static String apiGetAllBillsFactoryitemsInDay =
      '$baseUrl/billsfactoryitems/day.php';
  //*************************billsin***********************
  static String apiGetBillsIn = '$baseUrl/billsin/view.php';
  static String apiGetCustomerBillsIn = '$baseUrl/billsin/customer.php';
  static String apiGetCustomerBillsInRange =
      '$baseUrl/billsin/customer_date.php';
  static String apiEditBillsIntNotes = '$baseUrl/billsin/notes.php';
  static String apiAddBillsIn = '$baseUrl/billsin/add.php';
  static String apiGetBillsInDate = '$baseUrl/billsin/date.php';
  static String apiGetBillsInPaymentDate = '$baseUrl/billsin/sum_payment.php';
  static String apiEditBillsIn = '$baseUrl/billsin/edit.php';
  static String apiSaveBillsIn = '$baseUrl/billsin/save.php';
  static String apiDeleteBillsIn = '$baseUrl/billsin/delete.php';
  //*************************billsInItems***********************
  static String apiGetBillsInItems = '$baseUrl/billsinitems/view.php';
  static String apiGetAllBillsInItems = '$baseUrl/billsinitems/view_all.php';
  static String apiAddBillsInItems = '$baseUrl/billsinitems/add.php';
  static String apiEditBillsInItems = '$baseUrl/billsinitems/edit.php';
  static String apiDeleteBillsInItems = '$baseUrl/billsinitems/delete.php';
  static String apiGetBillsInitemInRange = '$baseUrl/billsinitems/date.php';
  static String apiGetAllBillsInitemsInRange =
      '$baseUrl/billsinitems/date_all.php';
  static String apiGetAllBillsInitemsInDay = '$baseUrl/billsinitems/day.php';
  //*************************Bills Out***********************
  static String apiGetBillsOut = '$baseUrl/billsout/view.php';
  static String apiGetWorkBillsOut = '$baseUrl/billsout/work.php';
  static String apiAddBillsOut = '$baseUrl/billsout/add.php';
  static String apiGetBillsOutDate = '$baseUrl/billsout/date.php';
  static String apiEditBillsOut = '$baseUrl/billsout/edit.php';
  static String apiEditBillsOutNotes = '$baseUrl/billsout/notes.php';
  static String apiSaveBillsOut = '$baseUrl/billsout/save.php';
  static String apiDeleteBillsOut = '$baseUrl/billsout/delete.php';
  static String apiGetCustomerBillsOut = '$baseUrl/billsout/customer.php';
  static String apiGetCustomerBillsOutRange =
      '$baseUrl/billsout/customer_date.php';
  //*************************Bills Out Items***********************
  static String apiGetBillsOutItems = '$baseUrl/billsoutitems/view.php';
  static String apiGetAllBillsOutItems = '$baseUrl/billsoutitems/view_all.php';
  static String apiAddBillsOutItems = '$baseUrl/billsoutitems/add.php';
  static String apiEditBillsOutItems = '$baseUrl/billsoutitems/edit.php';
  static String apiDeleteBillsOutItems = '$baseUrl/billsoutitems/delete.php';
  static String apiGetBillsOutitemInRange = '$baseUrl/billsoutitems/date.php';
  static String apiGetAllBillsOutitemsInRange =
      '$baseUrl/billsoutitems/date_all.php';
  static String apiGetAllBillsOutitemsInDay = '$baseUrl/billsoutitems/day.php';
  //*************************billsstock***********************
  static String apiGetBillsStock = '$baseUrl/billsstock/view.php';
  static String apiAddBillsstock = '$baseUrl/billsstock/add.php';
  static String apiGetBillsstockDate = '$baseUrl/billsstock/date.php';
  static String apiGetBillsstockPaymentDate =
      '$baseUrl/billsstock/sum_payment.php';
  static String apiEditBillsstock = '$baseUrl/billsstock/edit.php';
  static String apiSaveBillsstock = '$baseUrl/billsstock/save.php';
  static String apiDeleteBillsstock = '$baseUrl/billsstock/delete.php';
  //*************************billsstockitems***********************
  static String apiGetBillsstockitems = '$baseUrl/billsstockitems/view.php';
  static String apiGetAllBillsstockitems =
      '$baseUrl/billsstockitems/view_all.php';
  static String apiAddBillsstockitems = '$baseUrl/billsstockitems/add.php';
  static String apiEditBillsstockitems = '$baseUrl/billsstockitems/edit.php';
  static String apiDeleteBillsstockitems =
      '$baseUrl/billsstockitems/delete.php';
  static String apiGetBillstockitemInRange =
      '$baseUrl/billsstockitems/date.php';
  static String apiGetAllBillstockitemsInRange =
      '$baseUrl/billsstockitems/date_all.php';
  static String apiGetAllBillstockitemsInDay =
      '$baseUrl/billsstockitems/day.php';
  //*************************Plans***********************
  static String apiGetPlans = '$baseUrl/plans/view.php';
  static String apiAddPlans = '$baseUrl/plans/add.php';
  static String apiSavePlans = '$baseUrl/plans/save.php';
  static String apiEditPlans = '$baseUrl/plans/edit.php';
  static String apiDeletePlans = '$baseUrl/plans/delete.php';
  static String apiUpdatePlan = '$baseUrl/plans/update.php';
  //*************************Plans Items***********************
  static String apiGetPlansItems = '$baseUrl/plansitems/view.php';
  static String apiGetAllPlansInItems = '$baseUrl/plansitems/view_all.php';
  static String apiAddPlansItems = '$baseUrl/plansitems/add.php';
  static String apiEditPlansItems = '$baseUrl/plansitems/edit.php';
  static String apiDeletePlansItems = '$baseUrl/plansitems/delete.php';
  static String apiDeleteAllPlanItems = '$baseUrl/plansitems/delete_all.php';
  static String apiUpdatePlanItems = '$baseUrl/plansitems/update.php';
  static String apiUpdateFactoryPlanItems =
      '$baseUrl/plansitems/update_factory.php';
  static String apiGetAllPlanItemsInDay = '$baseUrl/plansitems/day.php';
  //*************************Bills Shortage***********************
  static String apiGetBillShortage = '$baseUrl/billshortage/view.php';
  static String apiAddBillShortage = '$baseUrl/billshortage/add.php';
  static String apiGetBillShortageDate = '$baseUrl/billshortage/date.php';
  static String apiEditBillShortage = '$baseUrl/billshortage/edit.php';
  static String apiSaveBillShortage = '$baseUrl/billshortage/save.php';
  static String apiDeleteBillShortage = '$baseUrl/billshortage/delete.php';
  //*************************Bills Out Items***********************
  static String apiGetBillShortageItems = '$baseUrl/billshortageitems/view.php';
  static String apiGetAllBillShortageItems =
      '$baseUrl/billshortageitems/view_all.php';
  static String apiAddBillShortageItems = '$baseUrl/billshortageitems/add.php';
  static String apiEditBillShortageItems =
      '$baseUrl/billshortageitems/edit.php';
  static String apiDeleteBillShortageItems =
      '$baseUrl/billshortageitems/delete.php';
  static String apiGetBillShortageitemInRange =
      '$baseUrl/billshortageitems/date.php';
  static String apiGetAllBillShortageitemsInRange =
      '$baseUrl/billshortageitems/date_all.php';
  static String apiGetAllBillShortageitemsInDay =
      '$baseUrl/billshortageitems/day.php';
  //*************************Users***********************
  static String apiGetUsers = '$baseUrl/users/view.php';
  static String apiAddUsers = '$baseUrl/users/add.php';
  static String apiEditUsers = '$baseUrl/users/edit.php';
  static String apiDeleteUsers = '$baseUrl/users/delete.php';
  static String apiLogin = '$baseUrl/users/login.php';
  static String apiSerial = '$baseUrl/users/serial.php';
  //works
  static String apiAddWork = '$baseUrl/works/add.php';
  static String apiGetWorks = '$baseUrl/works/view.php';
  static String apiColseWork = '$baseUrl/works/close.php';
  static String apiUpdateTotalWork = '$baseUrl/works/update_total.php';
  static String apiUpdatePaymentWork = '$baseUrl/works/payment.php';
  static String apiGetLastWork = '$baseUrl/works/get_last.php';
  static String apiGetSumWork = '$baseUrl/works/sum.php';
  static String apiGetWorkBills = '$baseUrl/works/view_bills.php';
  static String apiGetWorksSales = '$baseUrl/works/work_sales.php';
  static String apiGetWorksPayment = '$baseUrl/works/work_payment.php';
  // work_payment
  static String apiAddWorkPayment = '$baseUrl/work_payment/add.php';
  static String apiGetWorkPayment = '$baseUrl/work_payment/view.php';
  static String apiUpdateWorkPayment = '$baseUrl/work_payment/update.php';
  static String apiDeleteWorkPayment = '$baseUrl/work_payment/delete.php';
  //employers
  static String apiAddEmp = '$baseUrl/emp/add.php';
  static String apiViewEmp = '$baseUrl/emp/view.php';
  static String apiViewbyJop = '$baseUrl/emp/view_by_jop.php';
  static String apiEditEmp = '$baseUrl/emp/edit.php';
  static String apiDeleteEmp = '$baseUrl/emp/delete.php';
  //employersAttend
  static String apiAddEmpDay = '$baseUrl/empAttend/add.php';
  static String apiMakeEmpattend = '$baseUrl/empAttend/attend.php';
  static String apiAddEmpAbsence = '$baseUrl/empAttend/absence.php';
  static String apiViewEmpDays = '$baseUrl/empAttend/view.php';
  static String apiEditEmpDay = '$baseUrl/empAttend/edit.php';
  static String apiExitEmpDay = '$baseUrl/empAttend/exit.php';
  static String apiDeleteEmpDay = '$baseUrl/empAttend/delete.php';
  static String apiViewAttendToday = '$baseUrl/empAttend/today.php';
  static String apiCloseAttendToday = '$baseUrl/empAttend/close_today.php';
  static String apiViewattendLogForEmp = '$baseUrl/empAttend/date.php';
// empSalery
  static String apiAddEmpSalery = '$baseUrl/empSalery/add.php';
  static String apiEditEmpSalery = '$baseUrl/empSalery/edit.php';
  static String apiGetEmpSalery = '$baseUrl/empSalery/emp.php';
  static String apiGetMonthSalery = '$baseUrl/empSalery/month.php';
  static String apiUpdateEmpSalery = '$baseUrl/empSalery/update.php';
  //*************************Bills Safe***********************
  static String apiGetBillSafe = '$baseUrl/billsafe/view.php';
  static String apiAddBillSafe = '$baseUrl/billsafe/add.php';
  static String apiGetBillSafeDate = '$baseUrl/billsafe/date.php';
  static String apiEditBillSafe = '$baseUrl/billsafe/edit.php';
  static String apiSaveBillSafe = '$baseUrl/billsafe/save.php';
  static String apiDeleteBillSafe = '$baseUrl/billsafe/delete.php';
  static String apiupdateSafe = '$baseUrl/billsafe/update.php';
  static String apiGetSafeValue = '$baseUrl/billsafe/get.php';
}
