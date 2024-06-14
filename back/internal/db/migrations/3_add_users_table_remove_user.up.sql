CREATE TABLE "users" (
    "uid" UUID DEFAULT gen_random_uuid(),
    "name" varchar NOT NULL,
    "email" varchar NOT NULL,
    "password" varchar NOT NULL,
    "created" timestamp NOT NULL,
    "chat_id" UUID DEFAULT gen_random_uuid()
);

CREATE TABLE "user_refresh_tokens" (
    "user_uid" UUID NOT NULL,
    "token" varchar NOT NULL,
    "created" timestamp without time zone NOT NULL,
    "expiry_time" timestamp without time zone NOT NULL,
    "used" BOOLEAN DEFAULT FALSE
);