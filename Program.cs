WebApplicationBuilder builder = WebApplication.CreateBuilder(args);
WebApplication app = builder.Build();

app.MapGet("/greeting", () => "Hello from API running in Docker container :)");

app.Run("http://*:80");