const Ziggy = {
    url: "http://focus.test",
    port: null,
    defaults: {},
    routes: {
        "ignition.healthCheck": {
            uri: "_ignition/health-check",
            methods: ["GET", "HEAD"],
        },
        "ignition.executeSolution": {
            uri: "_ignition/execute-solution",
            methods: ["POST"],
        },
        "ignition.updateConfig": {
            uri: "_ignition/update-config",
            methods: ["POST"],
        },
        dashboard: { uri: "dashboard", methods: ["GET", "HEAD"] },
        "users.create": { uri: "users/create", methods: ["GET", "HEAD"] },
        "users.store": { uri: "users", methods: ["POST"] },
        "session.create": { uri: "session/create", methods: ["GET", "HEAD"] },
    },
};

if (typeof window !== "undefined" && typeof window.Ziggy !== "undefined") {
    Object.assign(Ziggy.routes, window.Ziggy.routes);
}

export { Ziggy };
