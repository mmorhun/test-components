FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app
COPY Program.cs ./
RUN dotnet publish -c Release -o /out

FROM mcr.microsoft.com/dotnet/aspnet:9.0-nanoserver-1809
WORKDIR /app
COPY --from=build /out .
EXPOSE 80
ENTRYPOINT ["dotnet", "Program.dll"]
