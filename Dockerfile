# Image format: quay.io/org/namespace/app-name/component-name
FROM quay.io/mmorhun-org/test/nudge-app/component1-nudging:tag@sha256:755eca45580f5062fa73d35be0182cdf1a0ab3b123f9c20c3aa18e6af5999796 AS source

FROM python:3.9-slim AS runner
WORKDIR /app
COPY --from=source /app/app.py .
EXPOSE 8080
CMD ["python", "app.py"]
