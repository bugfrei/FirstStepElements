using AdminService as service from '../../srv/service';

annotate service.Abteilungen with @(
    UI.LineItem : [
        { $Type  : 'UI.DataFieldForAction', Action : 'AdminService.movePersonalToNewAbteilung',   Label  : 'Abteilung zuweisen'   },
        //{ $Type  : 'UI.DataFieldForAction', Action : 'AdminService.movePersonalToNewAbteilung',   Label  : 'RejectBox'   },
        {
            $Type : 'UI.DataField',
            Label : 'id',
            Value : id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'max',
            Value : max,
        },
    ]
);
annotate service.Abteilungen with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'id',
                Value : id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'max',
                Value : max,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
