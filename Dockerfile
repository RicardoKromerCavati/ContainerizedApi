#SDK
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app

COPY ./ ./

RUN dotnet restore
# This creates a directory called 'out' in inside the working dir '/app'
RUN dotnet publish -c Release -o out 

#Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0

#WORKDIR /app

#Copy everything from /app/out found on 'build' alias to current folder.
COPY --from=build /app/out .

EXPOSE 8080

ENTRYPOINT ["dotnet", "ApiAndDockerStudies.dll"]