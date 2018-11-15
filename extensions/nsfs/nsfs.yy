{
    "id": "153b09c2-298e-40e6-9158-57471155d34b",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "nsfs",
    "IncludedResources": [
        "Sprites\\spr_nsfs_demo_white32",
        "Scripts\\demo-scripts\\demo_button",
        "Scripts\\demo-scripts\\demo_trace",
        "Scripts\\demo-scripts\\demo_prompt",
        "Scripts\\demo-scripts\\demo_param",
        "Scripts\\demo-scripts\\demo_sfmt",
        "Scripts\\demo-scripts\\demo_status",
        "Fonts\\fnt_nsfs_demo",
        "Objects\\obj_nsfs_demo",
        "Rooms\\rm_nsfs_demo",
        "Included Files\\nsfs-doc.html"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 113497714299118,
    "date": "2018-27-09 12:02:31",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "7af6b168-d227-498a-8e17-85faa9df9c67",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 113497714299118,
            "filename": "nsfs.dll",
            "final": "",
            "functions": [
                {
                    "id": "0b0e2054-f41f-4531-84fa-01d7f92b6658",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "nsfs_get_status",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_get_status",
                    "returnType": 2
                },
                {
                    "id": "b3756c7b-8de5-4838-8aae-5ad8f1c06cb2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "nsfs_get_directory",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_get_directory",
                    "returnType": 1
                },
                {
                    "id": "976282c0-1110-488c-891d-b52f6226abf5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "nsfs_set_directory",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_set_directory",
                    "returnType": 2
                },
                {
                    "id": "ea9c7e3a-95ea-4368-8b7a-2146315320d3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "nsfs_init_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_init_raw",
                    "returnType": 2
                },
                {
                    "id": "f0a02309-1bfc-4458-872d-d0bfe83dc345",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_get_attributes_ns",
                    "help": "file_get_attributes_ns(path) : returned values as per https:\/\/msdn.microsoft.com\/en-us\/library\/windows\/desktop\/gg258117(v=vs.85).aspx",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_get_attributes_ns",
                    "returnType": 2
                },
                {
                    "id": "571b6829-1fa9-4ac4-b26a-a3a183c8731c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "file_set_attributes_ns",
                    "help": "file_set_attributes_ns(path, flags) : flags as per https:\/\/msdn.microsoft.com\/en-us\/library\/windows\/desktop\/gg258117(v=vs.85).aspx",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_set_attributes_ns",
                    "returnType": 2
                },
                {
                    "id": "09e528f7-ecb3-40c7-b9bb-afdee1c69ec7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_get_size_ns",
                    "help": "file_get_size_ns(path) : Returns size of the given file, in bytes.",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_get_size_ns",
                    "returnType": 2
                },
                {
                    "id": "d13c328c-a5db-4e66-9d29-14de1ddfb867",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_exists_ns",
                    "help": "file_exists_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_exists_ns",
                    "returnType": 2
                },
                {
                    "id": "6ed56d63-c3e8-46cc-a7f4-1125e0a91a2b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "directory_exists_ns",
                    "help": "directory_exists_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_exists_ns",
                    "returnType": 2
                },
                {
                    "id": "437eee27-ee7d-40ce-b134-3d69048ae05f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_delete_ns",
                    "help": "file_delete_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_delete_ns",
                    "returnType": 2
                },
                {
                    "id": "f3713a3f-31dc-436e-bd3b-25a3baa47423",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "directory_delete_ns",
                    "help": "directory_delete_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_delete_ns",
                    "returnType": 2
                },
                {
                    "id": "4d30ad87-110f-4207-be0a-cfac1aafc240",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "file_copy_ns",
                    "help": "file_copy_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_copy_ns",
                    "returnType": 2
                },
                {
                    "id": "c679e1d9-fa08-4ed1-b119-a1825fb98209",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "directory_copy_ns",
                    "help": "directory_copy_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_copy_ns",
                    "returnType": 2
                },
                {
                    "id": "ef7bb73b-4e9f-457f-9a1a-519504af7f4a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "file_rename_ns",
                    "help": "file_rename_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_rename_ns",
                    "returnType": 2
                },
                {
                    "id": "11c39a15-987b-49c0-b008-f6f396929b96",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "directory_rename_ns",
                    "help": "directory_rename_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_rename_ns",
                    "returnType": 2
                },
                {
                    "id": "d0a9be2c-30db-4da9-9caf-147cc74ec5b6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "file_move_ns",
                    "help": "file_move_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_move_ns",
                    "returnType": 2
                },
                {
                    "id": "5463bc10-eabb-48a9-956e-551cac4fd972",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "directory_move_ns",
                    "help": "directory_move_ns(from, to)",
                    "hidden": false,
                    "kind": 11,
                    "name": "directory_move_ns",
                    "returnType": 2
                },
                {
                    "id": "af31ef71-d87d-4805-9032-a70d5be518db",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "file_find_first_ns",
                    "help": "file_find_first_ns(mask)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_first_ns",
                    "returnType": 1
                },
                {
                    "id": "cd0dde29-844b-45cb-8bb0-286931c3463a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "file_find_next_ns",
                    "help": "file_find_next_ns()",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_next_ns",
                    "returnType": 1
                },
                {
                    "id": "49cdd5b9-0d74-449a-a64d-483036197fdc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "file_find_close_ns",
                    "help": "file_find_close_ns()",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_close_ns",
                    "returnType": 2
                },
                {
                    "id": "7519acfc-d697-4827-94f7-60ce1a8e88c6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "file_find_attributes_ns",
                    "help": "file_find_attributes_ns() : Returns the attributes of the current file in file_find",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_attributes_ns",
                    "returnType": 2
                },
                {
                    "id": "97253f1c-a6c8-4a03-aad4-376601c9a85c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "file_find_size_ns",
                    "help": "file_find_size_ns() : Returns the size (in bytes) of the current file in file_find",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_find_size_ns",
                    "returnType": 2
                },
                {
                    "id": "ef5ee2e5-cc06-44bf-b7e6-713d33dc9744",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "file_text_open_read_ns",
                    "help": "file_text_open_read_ns(path, codepage) : Codepage can be set to -1 for default (UTF-8)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_open_read_ns",
                    "returnType": 2
                },
                {
                    "id": "e9a753fe-90af-4a63-9df8-986a1d7e2a58",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "file_text_open_write_ns",
                    "help": "file_text_open_write_ns(path, codepage) : Codepage can be set to -1 for default (UTF-8)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_open_write_ns",
                    "returnType": 2
                },
                {
                    "id": "03516073-f58c-495d-aea9-fa47eaa4b37f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "file_text_open_append_ns",
                    "help": "file_text_open_append_ns(path, codepage) : Codepage can be set to -1 for default (UTF-8)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_open_append_ns",
                    "returnType": 2
                },
                {
                    "id": "f401be70-8a3d-41df-b46f-a8b1a040a279",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "file_text_close_ns",
                    "help": "file_text_close_ns(fileid)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_close_ns",
                    "returnType": 2
                },
                {
                    "id": "b1818667-05e8-46aa-b1e5-ed2c6931b3a7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "file_text_eof_ns",
                    "help": "file_text_eof_ns(fileid)",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_eof_ns",
                    "returnType": 2
                },
                {
                    "id": "b03c82c5-2bf5-4e22-b667-608d65de8e6a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "file_text_read_line_ns",
                    "help": "file_text_read_line_ns(fileid) : Reads the next line from a file, skips line separators after it.",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_read_line_ns",
                    "returnType": 1
                },
                {
                    "id": "3a5c6902-12ab-4679-a2d5-e4f13e4b2447",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "file_text_write_line_ns",
                    "help": "file_text_write_line_ns(fileid, text) : Writes a line and line separators into a file.",
                    "hidden": false,
                    "kind": 11,
                    "name": "file_text_write_line_ns",
                    "returnType": 2
                },
                {
                    "id": "e5964296-941b-4b7e-97e7-f3c20d642d52",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "buffer_load_ns_raw1",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_load_ns_raw1",
                    "returnType": 2
                },
                {
                    "id": "c10fdc40-3591-4ec1-8eef-9ca958e979bd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "buffer_load_ns_raw2",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_load_ns_raw2",
                    "returnType": 2
                },
                {
                    "id": "07de4a8e-4088-479e-99c8-5421dd75b80e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        1,
                        2
                    ],
                    "externalName": "buffer_save_ns_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_save_ns_raw",
                    "returnType": 2
                },
                {
                    "id": "151e2358-bb31-4dff-93d9-29605761a451",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "string_codepage",
                    "help": "string_codepage(str, codepage_from, codepage_to) : Converts a string between codepages. From\/to can be set to -1 for UTF-8",
                    "hidden": false,
                    "kind": 11,
                    "name": "string_codepage",
                    "returnType": 1
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                "0b0e2054-f41f-4531-84fa-01d7f92b6658",
                "b3756c7b-8de5-4838-8aae-5ad8f1c06cb2",
                "976282c0-1110-488c-891d-b52f6226abf5",
                "ea9c7e3a-95ea-4368-8b7a-2146315320d3",
                "f0a02309-1bfc-4458-872d-d0bfe83dc345",
                "571b6829-1fa9-4ac4-b26a-a3a183c8731c",
                "09e528f7-ecb3-40c7-b9bb-afdee1c69ec7",
                "d13c328c-a5db-4e66-9d29-14de1ddfb867",
                "6ed56d63-c3e8-46cc-a7f4-1125e0a91a2b",
                "437eee27-ee7d-40ce-b134-3d69048ae05f",
                "f3713a3f-31dc-436e-bd3b-25a3baa47423",
                "4d30ad87-110f-4207-be0a-cfac1aafc240",
                "c679e1d9-fa08-4ed1-b119-a1825fb98209",
                "ef7bb73b-4e9f-457f-9a1a-519504af7f4a",
                "11c39a15-987b-49c0-b008-f6f396929b96",
                "d0a9be2c-30db-4da9-9caf-147cc74ec5b6",
                "5463bc10-eabb-48a9-956e-551cac4fd972",
                "af31ef71-d87d-4805-9032-a70d5be518db",
                "cd0dde29-844b-45cb-8bb0-286931c3463a",
                "49cdd5b9-0d74-449a-a64d-483036197fdc",
                "7519acfc-d697-4827-94f7-60ce1a8e88c6",
                "97253f1c-a6c8-4a03-aad4-376601c9a85c",
                "ef5ee2e5-cc06-44bf-b7e6-713d33dc9744",
                "e9a753fe-90af-4a63-9df8-986a1d7e2a58",
                "03516073-f58c-495d-aea9-fa47eaa4b37f",
                "f401be70-8a3d-41df-b46f-a8b1a040a279",
                "b1818667-05e8-46aa-b1e5-ed2c6931b3a7",
                "b03c82c5-2bf5-4e22-b667-608d65de8e6a",
                "3a5c6902-12ab-4679-a2d5-e4f13e4b2447",
                "e5964296-941b-4b7e-97e7-f3c20d642d52",
                "c10fdc40-3591-4ec1-8eef-9ca958e979bd",
                "07de4a8e-4088-479e-99c8-5421dd75b80e",
                "151e2358-bb31-4dff-93d9-29605761a451"
            ],
            "origname": "extensions\\nsfs.dll",
            "uncompress": false
        },
        {
            "id": "3d3893b0-fe86-4434-86ca-eadc8b94acff",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "71d4e4c4-3a87-49db-a3ea-ba4331b3cac2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "nsfs_status",
                    "hidden": false,
                    "value": "nsfs_get_status()"
                },
                {
                    "id": "85ce03b8-ff0e-412a-b68b-820ba3f13d53",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "nsfs_is_available",
                    "hidden": false,
                    "value": "global.g_nsfs_is_available"
                }
            ],
            "copyToTargets": 113497714299118,
            "filename": "nsfs.gml",
            "final": "",
            "functions": [
                {
                    "id": "542b2c8b-59d5-4581-8100-45b92befa07d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "nsfs_init",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "nsfs_init",
                    "returnType": 2
                },
                {
                    "id": "5292bb0c-c61d-4252-b200-7369867f83e1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "buffer_load_ns",
                    "help": "buffer_load_ns(path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_load_ns",
                    "returnType": 2
                },
                {
                    "id": "688b91b0-3843-44d5-9d6e-b3d5ff919fca",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "buffer_save_ns",
                    "help": "buffer_save_ns(buffer, path)",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_save_ns",
                    "returnType": 2
                },
                {
                    "id": "5bb3cbbd-19bf-42da-a8ab-9bf040c388e8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "buffer_save_ext_ns",
                    "help": "buffer_save_ext_ns(buffer, path, offset, size)",
                    "hidden": false,
                    "kind": 11,
                    "name": "buffer_save_ext_ns",
                    "returnType": 2
                }
            ],
            "init": "nsfs_init",
            "kind": 2,
            "order": [
                "542b2c8b-59d5-4581-8100-45b92befa07d",
                "5292bb0c-c61d-4252-b200-7369867f83e1",
                "688b91b0-3843-44d5-9d6e-b3d5ff919fca",
                "5bb3cbbd-19bf-42da-a8ab-9bf040c388e8"
            ],
            "origname": "extensions\\gml.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "Proprietary",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "cc.yal.nsfs",
    "productID": "479BA64C943D4E6A670CEE8CF960FC0C",
    "sourcedir": "",
    "version": "1.0.2"
}