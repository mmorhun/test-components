# Image format: quay.io/org/namespace/component-name
FROM quay.io/mmorhun-org/test/component1-nudging:tag@sha256:35ca8d6568e5402922cccd5dbd9cfca7ae62285e4820a85deca4a51bd7b10993 AS source

FROM python:3.9-slim AS runner
WORKDIR /app
COPY --from=source /app/app.py .
EXPOSE 8080
CMD ["python", "app.py"]
