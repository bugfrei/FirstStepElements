namespace gemeinsam.firststeps.db;
using { cuid, managed} from '@sap/cds/common';

entity Abteilungen {
    key id  : Integer @mandatory;
    name    : String(100);
    max     : Integer;
}

entity Personal {
    key id          : Integer @mandatory;
    secLevel        : Integer;
    firstName       : String(100);
    lastName        : String(100);
    toAbteilung     : Association to one Abteilungen;
    //virtual testEnabled : Boolean;  // ersetzt durch virtuelles Feld in Service.cds 
};