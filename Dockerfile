FROM mcr.microsoft.com/dotnet/sdk:8.0 AS Build

WORKDIR /app

COPY ./ ./

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:8.0

COPY --from=Build /app/out .

EXPOSE 8080

ENTRYPOINT ["dotnet", "ApiAndDockerStudies.dll"]