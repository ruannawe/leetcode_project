#include "uthash.h"
#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    int id; // key
    char name[100];
    UT_hash_handle hh; // makes this structure hashable
} user;

user* users = NULL; // important! initialize to NULL

void add_user(int user_id, char* name)
{
    user* s = malloc(sizeof(user));
    s->id = user_id;
    strcpy(s->name, name);
    HASH_ADD_INT(users, id, s); // id is the name of the key field
}

void delete_user(user* user)
{
    HASH_DEL(users, user); // remove it (users is the head of the hash table)
    free(user);            // free it
}

user* find_user(int user_id)
{
    user* s;

    HASH_FIND_INT(users, &user_id, s); // s returns a pointer to the user structure
    return s;
}

void delete_all()
{
    user* current_user = NULL;
    user* tmp = NULL;

    HASH_ITER(hh, users, current_user, tmp)
    {
        HASH_DEL(
            users,
            current_user);  // delete it (users is the head of the hash table)
        free(current_user); // free it
    }
}

int main(int argc, char* argv[])
{
    add_user(1, "John Doe");
    add_user(2, "Jane Smith");
    add_user(3, "Emily Davis");

    user* user = find_user(2);
    if (user)
        printf("User ID %d: name %s\n", user->id, user->name);
    else
        printf("User not found\n");

    delete_all(); // when done, free all users
}
