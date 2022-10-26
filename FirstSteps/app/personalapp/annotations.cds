using AdminService as service from '../../srv/service';

annotate service.Personal with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'id',
            Value : id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'secLevel',
            Value : secLevel,
        },
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastName',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'toAbteilung_id',
            Value : toAbteilung_id,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'AdminService.movePersonalToNewAbteilung',
            Label : 'movePersonalToNewAbteilung',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'AdminService.testfunction',
            Label : 'testfunction',
        }
    ]
);
annotate service.Personal with @(
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
                Label : 'secLevel',
                Value : secLevel,
            },
            {
                $Type : 'UI.DataField',
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastName',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'toAbteilung_id',
                Value : toAbteilung_id,
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
