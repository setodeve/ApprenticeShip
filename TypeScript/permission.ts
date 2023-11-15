interface User {
  username: string;
  permissions: {
    canRead: boolean;
    canWrite: boolean;
    canDelete: boolean;
  };
}

const users: User[] = [
  {
    username: "山田",
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: false,
    },
  },
  {
    username: "佐藤",
    permissions: {
      canRead: false,
      canWrite: true,
      canDelete: false,
    },
  },
];

function checkPermission(username: string, permission: string) {
  for (let i = 0; i < users.length; i++) {
    if (users[i]["username"] == username) {
      console.log(users[i]["permissions"][permission]);
    }
  }
}

checkPermission("山田", "canWrite");
checkPermission("佐藤", "canDelete");
