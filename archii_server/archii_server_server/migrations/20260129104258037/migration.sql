BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "chat_messages" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint,
    "userId" bigint NOT NULL,
    "content" text NOT NULL,
    "isFromUser" boolean NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "metadata" json
);

-- Indexes
CREATE INDEX "chat_project_idx" ON "chat_messages" USING btree ("projectId");
CREATE INDEX "chat_user_idx" ON "chat_messages" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "projects" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "roomType" text NOT NULL,
    "style" text NOT NULL,
    "imagePath" text,
    "estimatedCost" double precision NOT NULL,
    "status" text NOT NULL,
    "userId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "project_user_idx" ON "projects" USING btree ("userId");


--
-- MIGRATION VERSION FOR archii_server
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('archii_server', '20260129104258037', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129104258037', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
