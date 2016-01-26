exception ValueError {
    1: string message,
}

exception ServerError {
    1: string message,
}

struct collection {
    1: string code
    2: string acronym
    3: string acronym2letters
    4: string status
    5: string domain
}

struct journal_identifiers {
    1: list<string> code,
    2: string collection
}

struct article_identifiers {
    1: string code,
    2: string collection,
    3: string processing_date
}

struct event_document {
    1: string code,
    2: string collection,
    3: string event,
    4: string date
}

struct event_journal {
    1: list<string> code,
    2: string collection,
    3: string event,
    4: string date
}

service ArticleMeta {
    list<event_document> article_history_changes(1: string collection, 2: string event, 3: string code 4: string from_date, 5: string until_date, 6: i32 limit, 7: i32 offset) throws (1: ValueError value_err, 2:ServerError server_err),
    list<event_journal> journal_history_changes(1: string collection, 2: string event, 3: string code, 4: string from_date, 5: string until_date, 6:i32 limit, 7: i32 offset) throws (1: ValueError value_err, 2:ServerError server_err),
    collection get_collection(1: string code) throws (1: ValueError value_err, 2:ServerError server_err),
    string get_article(1: string code, 2: string collection, 3: bool replace_journal_metadata, 4: string fmt) throws (1: ValueError value_err, 2:ServerError server_err),
    string get_journal(1: string code, 2: string collection) throws (1: ValueError value_err, 2:ServerError server_err),
    list<journal_identifiers> get_journal_identifiers(1: optional string collection, 2: i32 limit, 3: i32 offset) throws (1: ValueError value_err, 2:ServerError server_err),
    list<article_identifiers> get_article_identifiers(1: optional string collection, 2: optional string issn, 3: optional string from_date, 4: optional string until_date, 5: i32 limit, 6: i32 offset) throws (1:ValueError value_err, 2:ServerError server_err),
    list<collection> get_collection_identifiers() throws(1: ServerError server_err)
}