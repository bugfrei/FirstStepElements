using {gemeinsam.firststeps.db as db} from '../db/schema';

annotate AdminService.Personal with @odata.draft.enabled;
extend projection AdminService.Personal with {
  // REVISIT: shall be improved by omitting "null as"
  // virtuelle Felder um die Sichtbarkeit der Actions zu beinflussen
  virtual null as testEnabled      : Boolean @UI.Hidden,
}

// annotate AdminService.Personal {
//     actions {
//         testfunction  @(
//             Core.OperationAvailable : {$value: in.testEnabled},
//             //Core.OperationAvailable : in.testEnabled,         //andere Schreibweise für Zeile darüber
//             Common.SideEffects.TargetProperties : [
//             'in/testEnabled',
//             'in/firstName'
//             ],
//         );
//     }
// }
// // annotate BoxRentService.Box with {
// //   BeginDateAusleihe @Common.FieldControl  : BoxStatus.fieldControl;
// //   EndDateAusleihe   @Common.FieldControl  : BoxStatus.fieldControl;
// //   to_Patient        @Common.FieldControl  : BoxStatus.fieldControl;
// // } actions {
// //   rejectBox @(
// //     Core.OperationAvailable : in.rejectEnabled,
// //     Common.SideEffects.TargetProperties : [
// //       'in/BoxStatus_code',
// //       'in/acceptEnabled',
// //       'in/rejectEnabled',
// //       'in/availableEnabled',
// //     ],
// //   );
// //   };
//annotate AdminService.Personal with @odata.draft.enabled;
// annotate AdminService.Personal with @(
//   Capabilities.InsertRestrictions : {
//     Insertable : true,
//   }
// );
service AdminService {

    // entity PersonalSecLevels(slvl : Integer)
    // as select from db.Personal { * }
    // where secLevel = :slv

    entity Abteilungen as projection on db.Abteilungen;

    // entity Personal    as select from db.Personal actions {
    //     action testfunction() returns Personal;
    // };
    // entity Personal as select from db.Personal;

// BAUSTELLE // BAUSTELLE // BAUSTELLE // BAUSTELLE // BAUSTELLE // BAUSTELLE 
    entity Personal as select from db.Personal actions {
        action  movePersonalToNewAbteilung(
            
            abteilungId : Integer)returns Personal;

            //@sap.applicable.path : testEnabled // for OdataV2 only
             @Core.OperationAvailable : {$value: in.testEnabled}
            action testfunction() returns Personal;
    };

// BAUSTELLE ENDE // BAUSTELLE ENDE // BAUSTELLE ENDE // BAUSTELLE ENDE // BAUSTELLE ENDE // BAUSTELLE ENDE 
    type moveResult {
        success       : Boolean;
        personalId    : String;
        firstName     : String;
        abteilungId   : Integer;
        abteilungName : String;
    }

    //action movePersonalToNewAbteilung(personalId : Integer, abteilungId : Integer) returns moveResult;

}


// service ProjectService {

//     entity Users    as select from demo.Users;
//     entity Projects as select from demo.Projects;
//     function getDATE() returns Date;
//     function getProjectMembers(id : String) returns array of String;


//     type moveResult {
//         code: Integer;
//         success     : Boolean;
//         moveStatus  : String;
//         userId      : String;
//         username    : String;
//         projectId   : String;
//         projectname : String;

//     };

//     action moveUserToAnotherProject(userId : String, projectId: String) returns moveResult;

// }
