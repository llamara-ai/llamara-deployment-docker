
create table authenticated_users (
                                     displayName varchar(255),
                                     username varchar(255) not null,
                                     primary key (username)
);

create table knowledge (
                           token_count integer,
                           created_at timestamp(6) with time zone not null,
                           last_updated_at timestamp(6) with time zone not null,
                           id uuid not null,
                           checksum varchar(255) not null,
                           content_type varchar(255) not null,
                           ingestion_status varchar(255) not null check (ingestion_status in ('PENDING','SUCCEEDED','FAILED')),
                           label varchar(255),
                           type varchar(255) not null check (type in ('FILE','WEBLINK')),
                           source bytea not null,
                           primary key (id)
);

create table knowledge_permissions (
                                       knowledge_id uuid not null,
                                       permission varchar(255) check (permission in ('OWNER','READWRITE','READONLY','NONE')),
                                       username varchar(255) not null,
                                       primary key (knowledge_id, username)
);

create table knowledge_tags (
                                knowledge_id uuid not null,
                                tag varchar(255)
);

create table sessions (
                          created_at timestamp(6) with time zone not null,
                          id uuid not null,
                          label varchar(255),
                          username varchar(255),
                          primary key (id)
);

alter table if exists knowledge_permissions
    add constraint FKiybhwunrw2ea58jlhf6p5v0lb
    foreign key (username)
    references authenticated_users;

alter table if exists knowledge_permissions
    add constraint FKnq4v1080vp9yei40ro1pemvcw
    foreign key (knowledge_id)
    references knowledge;

alter table if exists knowledge_tags
    add constraint FKsd21bc94ic6goovolva3gss2l
    foreign key (knowledge_id)
    references knowledge;

alter table if exists sessions
    add constraint FKs1ip7youvhtwab621f6i6pdfg
    foreign key (username)
    references authenticated_users;
