WebApplicationBuilder builder = WebApplication.CreateBuilder(args);
WebApplication app = builder.Build();

app.MapGet("/", () => "Hello world?");

app.MapGet("/greeting", () => "GET Hello from API running in Docker container :)");

app.Run("http://0.0.0.0:8080");